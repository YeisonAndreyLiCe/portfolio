module.exports = {
  parserOpts: {
    headerPattern: /^(.*)\\(\w*)\((\w*)\):\s(#[1-9]\d*)\s(.*)$/,
    headerCorrespondence: ["class", "type", "scope", "ticket", "subject"],
  },
};
