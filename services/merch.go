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
const MerchURL string = "http://localhost:6969"

//Service Data Type
const MerchFormat string = "JSON"

//API Interface
var MerchRoutes = RouteCollection{
	Route{
		"GetMerchLocations",
		"GET",
		"/merch/locations",
		GetMerchLocations,
	},
	Route{
		"GetMerchItemAtLocation",
		"GET",
		"/merch/locations/{location}",
		GetMerchItemAtLocation,
	},
	Route{
		"ClearMerchItemAtLocation",
		"PUT",
		"/merch/locations/{location}",
		ClearMerchItemAtLocation,
	},
	Route{
		"GetMerchUsers",
		"GET",
		"/merch/users",
		GetMerchUsers,
	},
	Route{
		"GetMerchUserByNetid",
		"GET",
		"/merch/users/{netid}",
		GetMerchUserByNetid,
	},
	Route{
		"GetMerchUserByPin",
		"POST",
		"/merch/users/pins",
		GetMerchUserByPin,
	},
	Route{
		"CreateMerchTransaction",
		"POST",
		"/merch/transactions",
		CreateMerchTransaction,
	},
	Route{
		"GetItems",
		"GET",
		"/merch/items",
		GetItems,
	},
	Route{
		"CreateMerch",
		"POST",
		"/merch/items",
		CreateMerch,
	},
	Route{
		"GetMerch",
		"GET",
		"/merch/items/{id}",
		GetMerch,
	},
	Route{
		"UpdateMerch",
		"PUT",
		"/merch/items/{id}",
		UpdateMerch,
	},
	Route{
		"DeleteMerch",
		"DELETE",
		"/merch/items/{id}",
		DeleteMerch,
	},
}

//Route handler
func GetMerchLocations(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func GetMerchItemAtLocation(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func ClearMerchItemAtLocation(w http.ResponseWriter, r *http.Request) {
	proxy.PUT(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func GetMerchUsers(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func GetMerchUserByNetid(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func GetMerchUserByPin(w http.ResponseWriter, r *http.Request) {
	proxy.POST(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func CreateMerchTransaction(w http.ResponseWriter, r *http.Request) {
	proxy.POST(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func GetItems(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func CreateMerch(w http.ResponseWriter, r *http.Request) {
	proxy.POST(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func GetMerch(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func UpdateMerch(w http.ResponseWriter, r *http.Request) {
	proxy.PUT(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}

func DeleteMerch(w http.ResponseWriter, r *http.Request) {
	proxy.DELETE(w, MerchURL+r.URL.String(), MerchFormat, "", r)
}
