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
const MemeURL string = "http://groot-memes-service:42069"

//Service Data Type
const MemeFormat string = "JSON"

//API Interface
var MemeRoutes = services.RouteCollection{
	services.Route{
		"ListMemes",
		"GET",
		"/memes",
		ListMemes,
	},
	services.Route{
		"NewMeme",
		"POST",
		"/memes",
		NewMeme,
	},
	services.Route{
		"MemeInfo",
		"GET",
		"/memes/{meme_id}",
		MemeInfo,
	},
	services.Route{
		"DeleteMeme",
		"DELETE",
		"/memes/{meme_id}",
		DeleteMeme,
	},
	services.Route{
		"ApproveMeme",
		"PUT",
		"/memes/{meme_id}/approve",
		ApproveMeme,
	},
	services.Route{
		"CastMemeVote",
		"PUT",
		"/memes/{meme_id}/vote",
		CastMemeVote,
	},
	services.Route{
		"DeleteMemeVote",
		"DELETE",
		"/memes/{meme_id}/vote",
		DeleteMemeVote,
	},
	services.Route{
		"GetRandomMeme",
		"GET",
		"/memes/random",
		GetRandomMeme,
	},
}

// services.Route handler
func ListMemes(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, MemeURL+r.URL.String(), MemeFormat, "", r)
}

func NewMeme(w http.ResponseWriter, r *http.Request) {
	proxy.POST(w, MemeURL+r.URL.String(), MemeFormat, "", r)
}

func MemeInfo(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, MemeURL+r.URL.String(), MemeFormat, "", r)
}

func DeleteMeme(w http.ResponseWriter, r *http.Request) {
	proxy.DELETE(w, MemeURL+r.URL.String(), MemeFormat, "", r)
}

func ApproveMeme(w http.ResponseWriter, r *http.Request) {
	proxy.PUT(w, MemeURL+r.URL.String(), MemeFormat, "", r)
}

func CastMemeVote(w http.ResponseWriter, r *http.Request) {
	proxy.PUT(w, MemeURL+r.URL.String(), MemeFormat, "", r)
}

func DeleteMemeVote(w http.ResponseWriter, r *http.Request) {
	proxy.DELETE(w, MemeURL+r.URL.String(), MemeFormat, "", r)
}

func GetRandomMeme(w http.ResponseWriter, r *http.Request) {
	proxy.GET(w, MemeURL+r.URL.String(), MemeFormat, "", r)
}
