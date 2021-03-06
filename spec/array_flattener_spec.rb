require 'array_flattener'
require 'byebug'

describe ArrayFlattener do

  describe ".flatten" do
    context "input validation" do
      it "raises an exception if passed nil" do
        expect{ ArrayFlattener.flatten(nil) }.to raise_exception ArgumentError
      end

      it "raises an exception if passed something that isn't an array" do
        expect{ ArrayFlattener.flatten({a: 1, b:2}) }.to raise_exception ArgumentError
      end
    end

    context "when there is no nesting" do
      it "returns an empty array when given empty array" do
        expect(ArrayFlattener.flatten([])).to eq []
      end

      it "returns input if there is no nesting" do
        input = [1,2,3,4]
        expect(ArrayFlattener.flatten(input)).to eq input
      end
    end

    context "when there is a single layer of nesting" do
      it "flattens the input for non-empty arrays" do
        input = [1,[2,3,4]]

        expect(ArrayFlattener.flatten(input)).to eq [1,2,3,4]
      end

      it "flattens the input for empty arrays" do
        input = [[]]

        expect(ArrayFlattener.flatten(input)).to eq []
      end
    end

    context "when there are multiple layers of nesting" do
      it "flattens the input for non-empty arrays" do
        input = [1,[[2],3],4]

        expect(ArrayFlattener.flatten(input)).to eq [1,2,3,4]
      end

      it "flattens the input for empty arrays" do
        input = [[[]]]

        expect(ArrayFlattener.flatten(input)).to eq []
      end
    end
  end
end
