/**
* Copyright © 2017, ACM@UIUC
*
* This file is part of the Groot Project.
*
* The Groot Project is open source software, released under the University of
* Illinois/NCSA Open Source License. You should have received a copy of
* this license in a file with the distribution.
**/

package services

import (
	"net/http"

	"github.com/acm-uiuc/arbor/proxy"
	"github.com/acm-uiuc/arbor/services"
	"github.com/acm-uiuc/groot-api-gateway/config"
)

//Location
const HardwareURL string = config.HardwareURL

//Service Data Type
const HardwareFormat string = "JSON"

//API Interface
var HardwareRoutes = services.RouteCollection{
	services.Route{
		"NewItem",
		"POST",
		"/items/{id}",
		NewSession,
	},
	services.Route{
		"UpdateItem",
		"PUT",
		"/items/{id}",
		EndUsersSessions,
	},
	services.Route{
		"DeleteItem",
		"DELETE",
		"/item/{id}",
		GetAuthenticatedUser,
	},
}

// services.Route handler
func NewItem(w http.ResponseWriter, r *http.Request) {
	proxy.POST(w, HardwareURL+r.URL.String(), HardwareFormat, "", r)
}

func DeleteItem(w http.ResponseWriter, r *http.Request) {
	proxy.DELETE(w, HardwareURL+r.URL.String(), HardwareFormat, "", r)
}

func UpdateItem(w http.ResponseWriter, r *http.Request) {
	proxy.PUT(w, HardwareURL+r.URL.String(), HardwareFormat, "", r)
}
