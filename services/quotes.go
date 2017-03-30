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
const QuotesURL string = "http://groot-quotes-service:9494"

//Service Data Type
const QuoteFormat string = "JSON"

//API Interface
var QuotesRoutes = services.RouteCollection{
	services.Route{
		"GetAllQuotes",
		"GET",
		"/quotes",
		GetAllQuotes,
	},
	services.Route{
		"DeleteQuote",
		"DELETE",
		"/quotes/{id}",
		DeleteQuote,
	},
	services.Route{
		"GetQuote",
		"GET",
		"/quotes/{id}",
		GetQuote,
	},
	services.Route{
		"CastVote",
		"POST",
		"/quotes/{id}/vote",
		CastVote,
	},
	services.Route{
		"ApproveQuote",
		"PUT",
		"/quotes/{id}/approve",
		ApproveQuote,
	},
	services.Route{
		"DeleteVote",
		"DELETE",
		"/quotes/{id}/vote",
		DeleteVote,
	},
	services.Route{
		"CreateQuote",
		"POST",
		"/quotes",
		CreateQuote,
	},
	services.Route{
		"UpdateQuote",
		"PUT",
		"/quotes/{id}",
		UpdateQuote,
	},
}

// services.Route handler
func GetAllQuotes(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, QuotesURL+r.URL.String(), QuoteFormat, "", r)
}

func DeleteQuote(w http.ResponseWriter, r *http.Request) {
	proxy.DELETE(w, QuotesURL+r.URL.String(), QuoteFormat, "", r)
}

func GetQuote(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, QuotesURL+r.URL.String(), QuoteFormat, "", r)
}

func CreateQuote(w http.ResponseWriter, r *http.Request) {
	proxy.POST(w, QuotesURL+r.URL.String(), QuoteFormat, "", r)
}

func CastVote(w http.ResponseWriter, r *http.Request) {
	proxy.POST(w, QuotesURL+r.URL.String(), QuoteFormat, "", r)
}

func ApproveQuote(w http.ResponseWriter, r *http.Request) {
	proxy.PUT(w, QuotesURL+r.URL.String(), QuoteFormat, "", r)
}

func DeleteVote(w http.ResponseWriter, r *http.Request) {
	proxy.DELETE(w, QuotesURL+r.URL.String(), QuoteFormat, "", r)
}

func UpdateQuote(w http.ResponseWriter, r *http.Request) {
	proxy.PUT(w, QuotesURL+r.URL.String(), QuoteFormat, "", r)
}
