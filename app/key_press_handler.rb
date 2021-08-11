module KeyPressHandler

  def handle_keypress(args)
    if args.inputs.keyboard.key_up.up
      args.state.up_pressed_at = args.state.tick_count
      args.state.y             = args.state.y + 10
      args.state.y             = 720 if args.state.y > 720
    end

    if args.inputs.keyboard.key_up.down
      args.state.down_pressed_at = args.state.tick_count
      args.state.y               = args.state.y - 10
      args.state.y               = 0 if args.state.y < 0
    end

    if args.inputs.keyboard.key_up.left
      args.state.left_pressed_at = args.state.tick_count
      args.state.x               = args.state.x - 10
      args.state.x               = 0 if args.state.x < 0
    end

    if args.inputs.keyboard.key_up.right
      args.state.right_pressed_at = args.state.tick_count
      args.state.x                = args.state.x + 10
      args.state.y                = 1280 if args.state.y > 1280
    end
  end

end