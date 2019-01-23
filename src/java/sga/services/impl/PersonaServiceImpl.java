package sga.services.impl;

import sga.services.exceptions.BusinessException;
import sga.eis.dao.PersonaDao;
import sga.eis.dto.Persona;
import sga.eis.dto.PersonaPk;
import sga.eis.exceptions.PersonaDaoException;
import sga.eis.factory.PersonaDaoFactory;
import sga.eis.jdbc.ResourceManager;
import sga.services.PersonaService;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ubaldo
 */
public class PersonaServiceImpl implements PersonaService {

  //Utilizamos el patron singleton, solo existen un objeto de tipo UsuarioService en Memoria
  private static PersonaService personaServiceInstance;
  //Creamos un atributo personaDao para comunicarnos con la capa de datos
  PersonaDao personaDao;

  //Constructor sin argumentos privado, para implementar el patron singleton
  private PersonaServiceImpl() {
  }

  //Creamos una nueva y unica instancia si es que no existe
  public static PersonaService getInstance() {
    if (personaServiceInstance == null) {
      personaServiceInstance = new PersonaServiceImpl();
    }
    return personaServiceInstance;
  }

  public List<Persona> getAllPersonas() {
    try {
      this.personaDao = PersonaDaoFactory.create();
      return Arrays.asList(this.personaDao.findAll());
    } catch (PersonaDaoException ex) {
      throw new BusinessException("Existe un problema al obtener el arreglo de personas en la BD", ex);
    }
  }

  public Persona getPersonaById(Integer idPersona) {
    try {
      return this.personaDao.findByPrimaryKey(idPersona);
    } catch (PersonaDaoException ex) {
      throw new BusinessException("Existe un problema al obtener la persona con id:" + idPersona, ex);
    }
  }

  //Hacemos este metodo transaccional, ya que elmina todos o ninguno
  //y podría dejar afectado el estado de la Base de Datos
  public boolean eliminarPersonas(List<Integer> idPersonas) {

    Connection conn = null;

    try {
      //Comenzamos la transaccion, si algun elemento no se elminina
      //entonces ninguno se elmina
      // Obtenemos una conexion del pool

      conn = ResourceManager.getConnection();
      // Activamos el manejo transaccional
      conn.setAutoCommit(false);

      this.personaDao.setUserConn(conn);
      //Tenemos dos posibles opciones, crear un SQL con los id's a eliminar
      //o eliminar registro a registro. Escogemos la segunda opcion
      for (Integer persona : idPersonas) {
        this.personaDao.delete(new PersonaPk(persona));
      }

      // Guardamos los cambios en la BD
      conn.commit();
      //Regresamos la bandera indicando que se eliminaron los registros
      return true;

    } catch (PersonaDaoException ex) {
      try {
        conn.rollback();
      } catch (SQLException ex1) {
        throw new BusinessException("No se pudo reestablecer el estado de la Base de Datos", ex1);
      }
      throw new BusinessException("Existe un problema para eliminar los elementos: " + idPersonas, ex);
    } catch (SQLException ex) {
      try {
        conn.rollback();
      } catch (SQLException ex1) {
        throw new BusinessException("No se pudo reestablecer el estado de la Base de Datos", ex1);
      }
      throw new BusinessException("Existe un problema con la Base de Datos", ex);
    } finally {
      // Cerramos la conexión para regresala al pool
      ResourceManager.close(conn);
    }
  }

  //Hacemos el metodo transaccional, ya que puede quedar afectado el estado de la Base de Datos
  @Override
  public boolean guardarPersona(Persona persona) {
    Connection conn = null;

    try {
      //Comenzamos la transaccion

      // Obtenemos una conexion del pool
      conn = ResourceManager.getConnection();
      // Activamos el manejo transaccional
      conn.setAutoCommit(false);

      this.personaDao.setUserConn(conn);

      //Revisamos si es un insert o un update, dependiendo si se tiene o no el valor de la PK
      if (persona.getIdPersona() == null) {
        this.personaDao.insert(persona);
      } else {
        this.personaDao.update(persona.createPk(), persona);
      }

      // Guardamos los cambios en la BD
      conn.commit();
      //Regresamos la bandera indicando que se eliminaron los registros
      return true;

    } catch (PersonaDaoException ex) {
      try {
        conn.rollback();
      } catch (SQLException ex1) {
        throw new BusinessException("No se pudo reestablecer el estado de la Base de Datos", ex1);
      }
      throw new BusinessException("No se puedo agregar la Persona:" + persona + " a la BD", ex);
    } catch (SQLException ex) {
      try {
        conn.rollback();
      } catch (SQLException ex1) {
        throw new BusinessException("No se pudo reestablecer el estado de la Base de Datos", ex1);
      }
      throw new BusinessException("Existe un problema con la Base de Datos", ex);
    } finally {
      // Cerramos la conexión para regresala al pool
      ResourceManager.close(conn);
    }
  }
}
