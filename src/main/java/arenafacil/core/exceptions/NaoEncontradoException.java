package arenafacil.core.exceptions;

import org.apache.http.HttpStatus;

public class NaoEncontradoException extends ApplicationExceptionBase {

    public NaoEncontradoException(String message) {
        super(message, HttpStatus.SC_NOT_FOUND, CodigoErro.ENTIDADE_NAO_ENCONTRADA);
    }
}
