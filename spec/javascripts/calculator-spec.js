describe ("calculator", function() {
  it("should add two numbers", function() {
    calculator = createCalculator();
    expect(calculator.add(4,2).toEqual(6);)
  });

  it("should subtract two numbers", function() {
    calculator = createCalculator();
    expect(calculator.sub(4,2).toEqual(2);)
  });

  it("should multiply two numbers", function() {
    calculator = createCalculator();
    expect(calculator.mul(4,2).toEqual(8);)
  });

  it("should divide two numbers", function() {
    calculator = createCalculator();
    expect(calculator.div(4,2).toEqual(2);)
  });

});
