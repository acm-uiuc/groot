package main

import (
	"github.com/acm-uiuc/arbor/server"
	"github.com/acm-uiuc/groot-api-gateway/config"
	"github.com/acm-uiuc/groot-api-gateway/services"
)

func main() {
	config.LoadArborConfig()
	Routes := services.RegisterAPIs()
	server.Boot(Routes)
}
