let () =
  let root = React.div [%bs.obj {className = "outer"}] [|
    React.component ClickComponent.t [%bs.obj {name = "jane"}] [||]
  ; React.component ClickComponent.t [%bs.obj {name = "john"}] [||]
  ; React.div [%bs.obj {className = "test"}] [||]
  |] in
  let host = Dom.getElementById Dom.document "host" in
  match Js.Null_undefined.to_opt host with
    | None -> Js.log "Uhhhhhh shit's broke"
    | Some host -> React.render root host
