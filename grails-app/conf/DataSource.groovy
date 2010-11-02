dataSource {
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
            driverClassName = "com.mysql.jdbc.Driver"
            dbCreate = "update"
            url = "jdbc:mysql://localhost/jmeetings_db"
            username = "root"
            password = "root"
//            logSql = true
        }
    }
    test {
        dataSource {
            driverClassName = "org.hsqldb.jdbcDriver"
            dbCreate = "create-drop"
            url = "jdbc:hsqldb:file:jmeeting-db;shutdown=true"
            username = "sa"
            password = ""
        }
    }
    production {
        dataSource {
            driverClassName = "com.mysql.jdbc.Driver"
            dbCreate = "update"
            url = "jdbc:mysql://localhost/jmeetings_db"
            username = "root"
            password = "raposa"
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
