import Quick
import Nimble
import Succinct

final class UIViewController_UITextViewSpec: QuickSpec {
    override func spec() {
        describe("finding text views with exact text") {
            context("when a UITextView exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITextViewBuilder().withText("note").build()
                        )
                        .build()
                }

                it("can find it when the text matches exactly") {
                    expect(viewController.findTextView(withExactText: "note")).toNot(beNil())
                }

                it("cannot find it when the text doesn't match exactly") {
                    expect(viewController.findTextView(withExactText: "not")).to(beNil())
                }
            }

            context("when a UITextView exists in the second subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                UITextViewBuilder().withText("note").build()
                            )
                            .build()
                        )
                        .build()
                }

                it("can find it when the text matches exactly") {
                    expect(viewController.findTextView(withExactText: "note")).toNot(beNil())
                }

                it("cannot find it when the text doesn't match exactly") {
                    expect(viewController.findTextView(withExactText: "not")).to(beNil())
                }
            }

            context("when a UITextView doesn't exist") {
                it("cannot find it") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder().build()
                        )
                        .build()


                    expect(viewController.findTextView(withExactText: "note")).to(beNil())
                }
            }
        }

        describe("finding text views containing text") {
            context("when a UITextView exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITextViewBuilder().withText("my notes").build()
                        )
                        .build()
                }

                it("can find it when it contains the text") {
                    expect(viewController.findTextView(containingText: "note")).toNot(beNil())
                }

                it("cannot find it when it doesn't contain the text") {
                    expect(viewController.findTextView(containingText: "not the same text")).to(beNil())
                }
            }

            context("when a UITextView exists in the second subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder().withSubview(
                                UITextViewBuilder().withText("my notes").build()
                            )
                            .build()
                        )
                        .build()
                }

                it("can find it when it contains the text") {
                    expect(viewController.findTextView(containingText: "note")).toNot(beNil())
                }

                it("cannot find it when it doesn't contain the text") {
                    expect(viewController.findTextView(containingText: "not the same text")).to(beNil())
                }
            }

            context("when a UITextView doesn't exist") {
                it("cannot find it") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder().build()
                        )
                        .build()


                    expect(viewController.findTextView(containingText: "note")).to(beNil())
                }
            }
        }

        describe("has text views with exact text") {
            context("when a UITextView exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITextViewBuilder().withText("note").build()
                        )
                        .build()
                }

                it("can find it when the text matches exactly") {
                    expect(viewController.hasTextView(withExactText: "note")).to(beTrue())
                }

                it("cannot find it when the text doesn't match exactly") {
                    expect(viewController.hasTextView(withExactText: "not")).to(beFalse())
                }

            }

            context("when a UITextView exists in the second subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UITextViewBuilder().withText("note").build()
                                )
                                .build()
                        )
                        .build()
                }

                it("can find it when the text matches exactly") {
                    expect(viewController.hasTextView(withExactText: "note")).to(beTrue())
                }

                it("cannot find it when the text doesn't match exactly") {
                    expect(viewController.hasTextView(withExactText: "not")).to(beFalse())
                }
            }

            context("when a UITextView doesn't exist") {
                it("cannot find it") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder().build()
                        )
                        .build()


                    expect(viewController.hasTextView(withExactText: "note")).to(beFalse())
                }
            }
        }

        describe("has text views containing text") {
            context("when a UITextView exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITextViewBuilder().withText("my notes").build()
                        )
                        .build()
                }

                it("can find it when it contains the text") {
                    expect(viewController.hasTextView(containingText: "note")).to(beTrue())
                }

                it("cannot find it when it doesn't contain the text") {
                    expect(viewController.hasTextView(containingText: "not the same text")).to(beFalse())
                }
            }

            context("when a UITextView exists in the second subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UITextViewBuilder().withText("note").build()
                                )
                                .build()
                        )
                        .build()
                }

                it("can find it when it contains the text") {
                    expect(viewController.hasTextView(containingText: "note")).to(beTrue())
                }

                it("cannot find it when it doesn't contain the text") {
                    expect(viewController.hasTextView(containingText: "not the same text")).to(beFalse())
                }
            }

            context("when a UITextView doesn't exist") {
                it("cannot find it") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder().build()
                        )
                        .build()


                    expect(viewController.hasTextView(containingText: "note")).to(beFalse())
                }
            }
        }
    }
}
