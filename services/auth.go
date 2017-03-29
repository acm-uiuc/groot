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
const AuthURL string = config.AuthURL

//token
const AuthToken string = config.AuthPrefix + config.AuthToken

//Service Data Type
const AuthFormat string = "JSON"

//API Interface
var AuthRoutes = services.RouteCollection{
	services.Route{
		"NewSession",
		"POST",
		"/session",
		NewSession,
	},
	services.Route{
		"EndUsersSessions",
		"DELETE",
		"/session?username={username}",
		EndUsersSessions,
	},
	services.Route{
		"GetAuthenticatedUser",
		"GET",
		"/session/{token}",
		GetAuthenticatedUser,
	},
	services.Route{
		"ValidateSession",
		"POST",
		"/session/{token}",
		ValidateSession,
	},
	services.Route{
		"EndSession",
		"DELETE",
		"/session/{token}",
		EndSession,
	},
}

// services.Route handler
// w = writer, r = reader
func NewSession(w http.ResponseWriter, r *http.Request) {
	proxy.POST(w, AuthURL+r.URL.String(), AuthFormat, AuthToken, r)
}

func EndUsersSessions(w http.ResponseWriter, r *http.Request) {
	proxy.DELETE(w, AuthURL+r.URL.String(), AuthFormat, AuthToken, r)
}

func GetAuthenticatedUser(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, AuthURL+r.URL.String(), AuthFormat, AuthToken, r)
}

func ValidateSession(w http.ResponseWriter, r *http.Request) {
	proxy.POST(w, AuthURL+r.URL.String(), AuthFormat, AuthToken, r)
}

func EndSession(w http.ResponseWriter, r *http.Request) {
	proxy.DELETE(w, AuthURL+r.URL.String(), AuthFormat, AuthToken, r)
}
