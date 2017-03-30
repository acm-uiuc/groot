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
)

//Location
const MerchURL string = "http://groot-merch-service:6969"

//Service Data Type
const MerchFormat string = "JSON"

//API Interface
var MerchRoutes = services.RouteCollection{
	services.Route{
		"GetMerchLocations",
		"GET",
		"/merch/locations",
		GetMerchLocations,
	},
	services.Route{
		"GetMerchItemAtLocation",
		"GET",
		"/merch/locations/{location}",
		GetMerchItemAtLocation,
	},
	services.Route{
		"ClearMerchItemAtLocation",
		"PUT",
		"/merch/locations/{location}",
		ClearMerchItemAtLocation,
	},
	services.Route{
		"GetMerchUsers",
		"GET",
		"/merch/users",
		GetMerchUsers,
	},
	services.Route{
		"GetMerchUserByNetid",
		"GET",
		"/merch/users/{netid}",
		GetMerchUserByNetid,
	},
	services.Route{
		"GetMerchUserByPin",
		"POST",
		"/merch/users/pins",
		GetMerchUserByPin,
	},
	services.Route{
		"CreateMerchTransaction",
		"POST",
		"/merch/transactions",
		CreateMerchTransaction,
	},
	services.Route{
		"GetItems",
		"GET",
		"/merch/items",
		GetItems,
	},
	services.Route{
		"CreateMerch",
		"POST",
		"/merch/items",
		CreateMerch,
	},
	services.Route{
		"GetMerch",
		"GET",
		"/merch/items/{id}",
		GetMerch,
	},
	services.Route{
		"UpdateMerch",
		"PUT",
		"/merch/items/{id}",
		UpdateMerch,
	},
	services.Route{
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
