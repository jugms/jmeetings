dataSource {
	driverClassName = "org.hsqldb.jdbcDriver"
	username = "sa"
	password = ""
    pooled = true
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
            dbCreate = "update"
            url = "jdbc:hsqldb:file:jmeeting_db_dev/database;shutdown=true"
        }
    }
    test {
        dataSource {
            dbCreate = "create-drop"
            url = "jdbc:hsqldb:file:jmeeting_db_test/database;shutdown=true"
        }
    }
    production {
        dataSource {
            driverClassName = "com.mysql.jdbc.Driver"
            dbCreate = "update"
            url = "jdbc:mysql://localhost/jmeetings_db"
            username = "root"
            password = "root"
			dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
            properties {
                maxActive = 50
                maxIdle = 25
                minIdle = 5
                initialSize = 5
                minEvictableIdleTimeMillis = 60000
                timeBetweenEvictionRunsMillis = 60000
                maxWait = 10000
                //validationQuery = "/* ping */"
            }
        }
    }
}
