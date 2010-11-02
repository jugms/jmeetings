package jmeetings

import grails.test.*

class EventoTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }


    void testDeveValidarEventoComTodasPropriedades() {
        assertTrue new Evento(nome:"Javaneiros 2010",data:new Date(),email:"email@email.com.br").validate()
    }

     void testDeveSalvarDoisEventos(){
        def eventos = [ new Evento(nome:"Evento1",email:"email1@email.com.br"), new Evento(nome:"Evento2",email:"email3@email.com.br")]
        eventos*.save(flush:true)
        assertEquals 2,Evento.findAll().size()
    }

    void testDeveSalvar()
    {
        def evento = new Evento(nome:"Javaneiros 2010",email:"javaneiros@jugms.com.br")
        evento.save(flush:true)
        assertNotNull evento.id
    }

    void testInvalidarEventoComNomeJaCadastrado()
    {
        def evento = new Evento(nome:"Javaneiros 2010",email:"blz@email.com.br")
        assertFalse evento.validate()
        assert 1,evento.errors.allErrors.size()
        assertEquals "nome",evento.errors.allErrors.get(0).field
    }

    void testDeveNaoSalvarSemNome()
    {
        def evento = new Evento()
        evento.save(flush:true)
        assertNull evento.id
    }

    void testInvalidarEmail()
    {
        def evento = new Evento(nome:"Evento",email:"em@")
        assertFalse evento.validate()
        assert 1,evento.errors.allErrors.size()
        assertEquals "email",evento.errors.allErrors.get(0).field
    }

    void testInvalidarNovoEventoComEmailJaCadastrado()
    {
        def evento = new Evento(nome:"Novo Evento 2010",email:"javaneiros@jugms.com.br")
        assertFalse evento.validate()
        assert 1,evento.errors.allErrors.size()
        assertEquals "email",evento.errors.allErrors.get(0).field
    }

}
