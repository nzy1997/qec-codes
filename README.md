# Visualization of Quantum Error Correction Codes
This is a Typst package for visualizing quantum error correction codes.


## Steane code
You can draw a Steane code by calling the `steane_code` function. The name of the qubits are automatically generated as `steane_1`, `steane_2`, etc.
```java
#figure(canvas({
  import draw: *
  steane_code((0, 0), size: 3)
    for j in range(7) {
      content((rel: (0, -0.3), to: "steane" + "_" + str(j+1)), [#(j)])
    }
}))
```
## Qubit names
To label the qubits, you use the 

## Labels

## License

Licensed under the [MIT License](LICENSE).