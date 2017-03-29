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
const GigURL string = "http://localhost:8964"

//Service Data Type
const GigFormat string = "JSON"

//API Interface
var GigsRoutes = RouteCollection{
    Route{
        "ListGigs",
        "GET",
        "/gigs",
        ListGigs,
    },
    Route{
        "NewGig",
        "POST",
        "/gigs",
        NewGig,
    },
    Route{
        "GigInfo",
        "GET",
        "/gigs/{gig_id}",
        GigInfo,
    },
    Route{
        "DeactivateGig",
        "PUT",
        "/gigs/{gig_id}",
        DeactivateGig,
    },
    Route{
        "DeleteGig",
        "DELETE",
        "/gigs/{gig_id}",
        DeleteGig,
    },
    Route{
        "ListClaims",
        "GET",
        "/gigs/claims",
        ListClaims,
    },
    Route{
        "CreateClaim",
        "POST",
        "/gigs/claims",
        CreateClaim,
    },
    Route{
        "ListSingleClaim",
        "GET",
        "/gigs/claims/{claim_id}",
        ListSingleClaim,
    },
    Route{
        "AcceptClaim",
        "PUT",
        "/gigs/claims/{claim_id}",
        AcceptClaim,
    },
    Route{
        "DeleteClaim",
        "DELETE",
        "/gigs/claims/{claim_id}",
        DeleteClaim,
    },
}

//Route handler
func ListGigs(w http.ResponseWriter, r *http.Request) {
    proxy.GET(w, GigURL+r.URL.String(), GigFormat, "", r)
}

func NewGig(w http.ResponseWriter, r *http.Request) {
    proxy.POST(w, GigURL+r.URL.String(), GigFormat, "", r)
}

func GigInfo(w http.ResponseWriter, r *http.Request) {
    proxy.GET(w, GigURL+r.URL.String(), GigFormat, "", r)
}

func CreateClaim(w http.ResponseWriter, r *http.Request) {
    proxy.POST(w, GigURL+r.URL.String(), GigFormat, "", r)
}

func DeactivateGig(w http.ResponseWriter, r *http.Request) {
    proxy.PUT(w, GigURL+r.URL.String(), GigFormat, "", r)
}

func DeleteGig(w http.ResponseWriter, r *http.Request) {
    proxy.DELETE(w, GigURL+r.URL.String(), GigFormat, "", r)
}

func ListClaims(w http.ResponseWriter, r *http.Request) {
    proxy.GET(w, GigURL+r.URL.String(), GigFormat, "", r)
}

func ListSingleClaim(w http.ResponseWriter, r *http.Request) {
    proxy.GET(w, GigURL+r.URL.String(), GigFormat, "", r)
}

func AcceptClaim(w http.ResponseWriter, r *http.Request) {
    proxy.PUT(w, GigURL+r.URL.String(), GigFormat, "", r)
}

func DeleteClaim(w http.ResponseWriter, r *http.Request) {
    proxy.DELETE(w, GigURL+r.URL.String(), GigFormat, "", r)
}
