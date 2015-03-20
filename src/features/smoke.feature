Feature: qcumber

	Scenario: synchronous
		Given a synchronous precondition
		When an asynchronous action occurs
		When an action requiring correct scope
		Then an asynchronous error condition
		And it can be re-Qed
