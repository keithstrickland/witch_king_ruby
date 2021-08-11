include KeyPressHandler

def initialize_game_state(args)
  puts "init game state..."
  args.state.rotation ||= 0
  args.state.x        ||= 576
  args.state.y        ||= 100

  args.state.player    ||= Player.new
  args.state.player.x  ||= 0
  args.state.player.y  ||= 0
  args.state.player.hp ||= 100


  args.state.initial_state_set = true
end

def set_output(args)
  args.outputs.sprites << [args.state.x, args.state.y, 128, 64, 'sprites/sanctuary.png']
  args.outputs.labels << [580, 400, 'Hello World!']
end

def tick(args)
  args.state.initial_state_set ||= false
  initialize_game_state(args) unless args.state.initial_state_set

  set_output(args)

  KeyPressHandler::handle_keypress(args)
  # if args.inputs.mouse.click
  #   args.state.x = args.inputs.mouse.click.point.x - 64
  #   args.state.y = args.inputs.mouse.click.point.y - 50
  # end
end
