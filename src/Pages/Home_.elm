module Pages.Home_ exposing (Model, Msg, page)

import Components.Layout as Layout exposing (initLayout)
import Dict exposing (Dict)
import Gen.Params.Home_ exposing (Params)
import Gen.Route as Route
import Html exposing (Html, a, div, h1, h2, h5, input, label, li, section, text, ul)
import Html.Attributes as Attr exposing (class)
import Html.Attributes.Aria exposing (ariaLabel, ariaLabelledby)
import Page
import Request
import Shared
import Svg exposing (desc)
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page _ _ =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }



-- INIT


type alias Room =
    { room : Dict Int Bool
    }


type alias Model =
    { room : Dict String Room }


init : Model
init =
    { room = Dict.empty
    }



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model



-- VIEW


view : Model -> View Msg
view model =
    { title = "Revex - Home"
    , body =
        Layout.viewLayout
            { initLayout
                | route = Route.Home_
                , rootAttrs = []
                , rootContent = viewPage model
            }
    }


viewPage : Model -> List (Html Msg)
viewPage model =
    [ section [ class "room-container" ]
        [ h5 [] [ text "first room" ]
        , viewLightsContainer model
        ]
    ]


viewLightsContainer : Model -> Html Msg
viewLightsContainer model =
    let
        lights =
            [ viewLight model, viewLight model, viewLight model, viewLight model, viewLight model, viewLight model, viewLight model, viewLight model, viewLight model, viewLight model, viewLight model ]

        amountOfLights =
            "list-lights--" ++ (List.length lights |> String.fromInt)
    in
    ul [ Attr.classList [ ( "list-lights", True ), ( amountOfLights, True ) ] ] lights


viewLight : Model -> Html Msg
viewLight model =
    li [ class "light" ]
        [ label [ class "light__label" ]
            [ input
                [ class "light__label__input"
                , Attr.type_ "checkbox"
                ]
                []
            ]
        ]
