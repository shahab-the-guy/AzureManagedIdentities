workspace {

    !identifiers hierarchical

    model {
        user = person "Jane"
        
        weather_forecast = softwareSystem "Weather Forecast" {

            tags "team_awesome"
            
            api = container "Web API" {
                tags "Microsoft Azure - App Services" "team_awesome"
                technology "ASP.NET Core"
            }

            database = container "Database" {
                tags "Microsoft Azure - Azure Cosmos DB" "team_awesome"
                technology "Azure Cosmos DB"
            }

            api -> database "Fetches Weather Data"
        }

        user -> weather_forecast.api "Gets weather data"
    }

    views {
       
        theme default
        theme https://static.structurizr.com/themes/microsoft-azure-2023.01.24/theme.json

        properties {
            "structurizr.sort" "created"
        }

        styles {

            element "Software System" {
                strokeWidth 4
            }

            element "team_awesome" {
                stroke #F6D643
                strokeWidth 10
            }
        }

        systemContext weather_forecast "SystemContextDiagtram" {
            include *
        }

        container weather_forecast "ContainerDiagram" {
            include *
        }
    }
}
