DROP TRIGGER IF EXISTS trigger_unidades ON evento_reposicao;
DROP FUNCTION IF EXISTS verifica_unidades();
DROP TRIGGER IF EXISTS cat_contida_trigger ON tem_outra;
DROP FUNCTION IF EXISTS cat_contida();
DROP TRIGGER IF EXISTS prod_prateleira_trigger ON planograma;
DROP FUNCTION IF EXISTS prod_prateleira();

/*(RI-1) Uma Categoria não pode estar contida em si própria*/
CREATE OR REPLACE FUNCTION cat_contida()
RETURNS TRIGGER AS
$$
DECLARE
    cat_super varchar(80) := NEW.super_categoria;
    cat varchar(80) := New.categoria;

BEGIN
    LOOP
        IF cat IN ( SELECT cat_super FROM tem_outra WHERE cat_super = cat) THEN
            RAISE EXCEPTION 'category is contained in itself!';
        ELSE
            RETURN NEW;
        END IF;

    END LOOP;
        
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER cat_contida_trigger
BEFORE UPDATE OR INSERT ON tem_outra
FOR EACH ROW EXECUTE PROCEDURE cat_contida();

/* (RI-4) O número de unidades repostas num Evento de Reposição não pode exceder o número de 
unidades especificado no Planograma */

CREATE OR REPLACE FUNCTION verifica_unidades()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.unidades > ANY 
        (SELECT unidades
        FROM planograma
        WHERE planograma.ean=NEW.ean AND planograma.nro=NEW.nro AND 
            planograma.num_serie=NEW.num_serie AND planograma.fabricante=NEW.fabricante) THEN
            RAISE EXCEPTION 'Unidades a repor do produto excedem as descritas no planograma';
    END IF;

    RETURN NEW;
END;
$$LANGUAGE plpgsql;

CREATE TRIGGER trigger_unidades
BEFORE UPDATE OR INSERT ON evento_reposicao
FOR EACH ROW EXECUTE PROCEDURE verifica_unidades();

/* (RI-5) Um Produto só pode ser reposto numa Prateleira que apresente (pelo menos) uma das 
Categorias desse produto */

CREATE OR REPLACE FUNCTION prod_prateleira()
RETURNS TRIGGER AS
$$
DECLARE
    cat_prateleira varchar(80);
    cat_produto varchar(80);
    new_cat varchar(80);
BEGIN
    SELECT nome INTO cat_prateleira
    FROM prateleira
    WHERE nro = NEW.nro AND num_serie = NEW.num_serie AND fabricante = NEW.fabricante;

    SELECT cat INTO cat_produto
    FROM produto
    WHERE ean = NEW.ean;

    IF cat_prateleira = cat_produto THEN
        RETURN NEW;
    ELSE
        LOOP
            IF cat_prateleira IN (SELECT super_categoria as new_cat FROM tem_outra WHERE categoria = cat_produto)
                THEN RETURN NEW;
            ELSEIF new_cat IS NULL THEN
                RAISE EXCEPTION 'replenishment of this product not possible in this shelf';
            ELSE
                cat_produto := new_cat;
            END IF;
        END LOOP;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER prod_prateleira_trigger
BEFORE UPDATE OR INSERT ON planograma
FOR EACH ROW EXECUTE PROCEDURE prod_prateleira(); 