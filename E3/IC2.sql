DROP TRIGGER IF EXISTS trigger_unidades ON evento_reposicao;
DROP FUNCTION IF EXISTS verifica_unidades();

/* (RI-4) O número de unidades repostas num Evento de Reposição não pode exceder o número de 
unidades especificado no Planograma */

CREATE OR REPLACE FUNCTION verifica_unidades()
RETURN TRIGGER AS
$$
BEGIN
    IF NEW.unidades > ANY 
        (SELECT unidades
        FROM planograma
        WHERE planograma.ean=NEW.ean AND planograma.nro=NEW.nro AND planograma.num_serie=NEW.num_serie AND planograma.fabricante=NEW.fabricante) THEN
            RAISE EXCEPTION 'Unidades a repor (%) do produto % excedem as descritas no planograma (%)', NEW.unidades, NEW.ean, planograma.unidades;
    END IF;

    RETURN NEW;
END;
$$LANGUAGE plpgsql;

CREATE TRIGGER trigger_unidades
BEFORE UPDATE OR INSERT ON evento_reposicao
FOR EACH ROW EXECUTE PROCEDURE verifica_unidades();