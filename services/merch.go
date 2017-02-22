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

	"github.com/acm-uiuc/groot/proxy"
)

//Location
const MerchURL string = "http://localhost:9291"

//Service Data Type
const MerchFormat string = "JSON"

//API Interface
var MerchRoutes = RouteCollection{
	Route{
		"GetMerchUsers",
		"GET",
		"/merch/users",
		GetMerchUsers,
	},
	Route{
		"GetMerchUser",
		"GET",
		"/merch/users/{netid}",
		GetMerchUser,
	},
	Route{
		"CreateUserTransaction",
		"POST",
		"/merch/transactions/",
		CreateUserTransaction,
	},
	Route{
		"ConfirmUserTransaction",
		"PUT",
		"/merch/transactions/",
		ConfirmUserTransaction,
	},
	Route{
		"GetItems",
		"GET",
		"/merch/items/",
		GetItems,
	},
}

//Route handler
func GetMerchUsers(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func GetMerchUser(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func CreateUserTransaction(w http.ResponseWriter, r *http.Request) {
	proxy.POST(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func ConfirmUserTransaction(w http.ResponseWriter, r *http.Request) {
	proxy.PUT(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func GetItems(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}
