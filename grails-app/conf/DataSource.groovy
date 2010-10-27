dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
//    driverClassName = "org.hsqldb.jdbcDriver"
    username = "user"
    password = "senha"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            //dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:devDB"
	    //url = "jdbc:hsqldb:file:/media/dados/workspaces/grails/jmeetings_db/jmeetings_db;shutdown=true"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost/jmeetings_db"
        }
    }
}
