package builtInChips;

import Hack.Gates.*;

/**
 * A simple pass-through from the input pin to the output pin.
 *
 * Provided as a "gate" so that we can use pass-through in HDL definitions of
 * chips, since the HDL doesn't offer any direct syntax to support this.
 */
public class Wire extends BuiltInGate {
    protected void reCompute() {
        outputPins[0].set(inputPins[0].get());
    }
}
