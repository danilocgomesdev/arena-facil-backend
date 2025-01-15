package arenafacil.core.exceptions.mapper;

import arenafacil.core.exceptions.ApplicationExceptionBase;
import arenafacil.core.exceptions.CodigoErro;

public record ExceptionInfoHolder(int httpCode, String mensagem, CodigoErro codigoErro) {

    public static ExceptionInfoHolder fromApplicationExceptionBase(ApplicationExceptionBase exceptionBase) {
        return new ExceptionInfoHolder(exceptionBase.getHttpCode(), exceptionBase.getMessage(), exceptionBase.getCodigoErro());
    }
}