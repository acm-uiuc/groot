package main

import (
	"github.com/acm-uiuc/arbor/server"
	"github.com/acm-uiuc/groot/services"
)

func main() {
	Routes = services.RegisterAPIs()
	server.Boot(Routes)
}
