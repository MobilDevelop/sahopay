abstract class PinState{}

class PinInitial extends PinState{}

class PinMessage extends PinState{
  String message;
  PinMessage(this.message);
}

class PinNextHome extends PinState{}

class PinClose extends PinState{}