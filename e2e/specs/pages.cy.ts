describe("Web site", (): void => {
  it("Navigation", (): void => {
    cy.visit("/");
    cy.contains("Yeison Liscano").click();

    cy.contains("About Me");
    cy.contains("Background");
    cy.contains("Education");

    cy.contains("Posts").click();
    cy.contains("Read Post");
    cy.contains("Contact").click();

    cy.contains("Contact Information");
  });
});
