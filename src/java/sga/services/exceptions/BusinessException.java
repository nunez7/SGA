package sga.services.exceptions;

/**
 *
 * @author Ubaldo
 */
public class BusinessException extends RuntimeException{


  public BusinessException(String mensaje, Exception e){
    super(mensaje, e);
  }


}
