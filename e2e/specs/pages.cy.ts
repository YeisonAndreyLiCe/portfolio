describe("Web site", (): void => {
  it("Navigation", (): void => {
    cy.visit("/");
    cy.contains("Yeison Liscano").click();

    cy.contains("About Me");
    cy.contains("Background");
    cy.contains("Education");

    cy.contains("posts").click();
    cy.contains("Read Post");
  });
});
