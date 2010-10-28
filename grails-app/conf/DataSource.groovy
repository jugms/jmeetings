dataSource {
    pooled = true
	driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
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
			url = "jdbc:hsqldb:file:jmeetings_db/data;shutdown=true"
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
			driverClassName = "com.mysql.jdbc.Driver"
			username = "usuario producao"
			password = "senha producao"
            dbCreate = "update"
            url = "jdbc:mysql://localhost/jmeetings_db"
        }
    }
}
