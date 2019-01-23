package sga.services;

import sga.eis.dto.Persona;
import java.util.List;

/**
 *
 * @author Ubaldo
 */
public interface PersonaService {

  public List<Persona> getAllPersonas();

  public Persona getPersonaById(Integer idPersona);

  public boolean eliminarPersonas(List<Integer> idPersonas);

  public boolean guardarPersona(Persona persona);

}
