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
const UsersURL string = config.UsersURL

//Service Data Type
const UsersFormat string = "JSON"

//API Interface
var UsersRoutes = services.RouteCollection{
	services.Route{
		"GetUsers",
		"GET",
		"/users",
		GetUsers,
	},
	services.Route{
		"IsMember",
		"GET",
		"/users/{netid}/is_member",
		IsMember,
	},
	services.Route{
		"NewUser",
		"POST",
		"/users",
		NewUser,
	},
	services.Route{
		"ConfirmUser",
		"PUT",
		"/users/{user_id}/paid",
		ConfirmUser,
	},
	services.Route{
		"DeleteUser",
		"DELETE",
		"/users/{user_id}",
		DeleteUser,
	},
	services.Route{
		"UsersLogin",
		"POST",
		"/users/login",
		UsersLogin,
	},
	services.Route{
		"UsersLogout",
		"POST",
		"/users/logout",
		UsersLogout,
	},
}

// services.Route handler
func GetUsers(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, UsersURL+r.URL.String(), UsersFormat, "", r)
}

func IsMember(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, UsersURL+r.URL.String(), UsersFormat, "", r)
}

func NewUser(w http.ResponseWriter, r *http.Request) {
	proxy.POST(w, UsersURL+r.URL.String(), UsersFormat, "", r)
}

func ConfirmUser(w http.ResponseWriter, r *http.Request) {
	proxy.PUT(w, UsersURL+r.URL.String(), UsersFormat, "", r)
}

func DeleteUser(w http.ResponseWriter, r *http.Request) {
	proxy.DELETE(w, UsersURL+r.URL.String(), UsersFormat, "", r)
}

func UsersLogin(w http.ResponseWriter, r *http.Request) {
	proxy.POST(w, UsersURL+r.URL.String(), UsersFormat, "", r)
}

func UsersLogout(w http.ResponseWriter, r *http.Request) {
	proxy.POST(w, UsersURL+r.URL.String(), UsersFormat, "", r)
}
