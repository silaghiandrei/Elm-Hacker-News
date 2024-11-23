module View.Posts exposing (..)

import Html exposing (Html, div, text, table, thead, tr, th, tbody, td)
import Html.Attributes exposing (href, class)
import Html.Events
import Model exposing (Msg(..))
import Model.Post exposing (Post)
import Model.PostsConfig exposing (Change(..), PostsConfig, SortBy(..), filterPosts, sortFromString, sortOptions, sortToCompareFn, sortToString)
import Time
import Util.Time
import Url exposing (Url)


{-| Show posts as a HTML [table](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/table)

Relevant local functions:

  - Util.Time.formatDate
  - Util.Time.formatTime
  - Util.Time.formatDuration (once implemented)
  - Util.Time.durationBetween (once implemented)

Relevant library functions:

  - [Html.table](https://package.elm-lang.org/packages/elm/html/latest/Html#table)
  - [Html.tr](https://package.elm-lang.org/packages/elm/html/latest/Html#tr)
  - [Html.th](https://package.elm-lang.org/packages/elm/html/latest/Html#th)
  - [Html.td](https://package.elm-lang.org/packages/elm/html/latest/Html#td)

-}
postTable : PostsConfig -> Time.Posix -> List Post -> Html Msg
postTable config time posts =
  let
      filteredPosts = filterPosts config posts
  in
  
    table [] [postHead, (postBody time filteredPosts)]

postHead : Html Msg
postHead = 
    thead [] [
      tr [] [
        th [] [text "Score"],
        th [] [text "Title"],
        th [] [text "Type"],
        th [] [text "Posted date"],
        th [] [text "Link"]
      ]
    ]

postBody : Time.Posix -> List Post -> Html Msg
postBody time posts = 
  tbody [] (List.map (postRow time) posts)

postRow : Time.Posix -> Post -> Html Msg
postRow time post = 
    tr [] 
      [
          td [class "post-score"] [text (String.fromInt post.score)],
          td [class "post-title"] [text post.title],
          td [class "post-type"] [text post.type_],
          td [class "post-time"] [text (Util.Time.formatTime Time.utc time)],
          td [class "post-url"] [
            case post.url of
                Just url -> text url
                Nothing -> text "No link"
          ]
    ]
    


{-| Show the configuration options for the posts table

Relevant functions:

  - [Html.select](https://package.elm-lang.org/packages/elm/html/latest/Html#select)
  - [Html.option](https://package.elm-lang.org/packages/elm/html/latest/Html#option)
  - [Html.input](https://package.elm-lang.org/packages/elm/html/latest/Html#input)
  - [Html.Attributes.type\_](https://package.elm-lang.org/packages/elm/html/latest/Html-Attributes#type_)
  - [Html.Attributes.checked](https://package.elm-lang.org/packages/elm/html/latest/Html-Attributes#checked)
  - [Html.Attributes.selected](https://package.elm-lang.org/packages/elm/html/latest/Html-Attributes#selected)
  - [Html.Events.onCheck](https://package.elm-lang.org/packages/elm/html/latest/Html-Events#onCheck)
  - [Html.Events.onInput](https://package.elm-lang.org/packages/elm/html/latest/Html-Events#onInput)

-}
postsConfigView : PostsConfig -> Html Msg
postsConfigView _ =
    div [] []

