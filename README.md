# qcumber

Add [Q][Q] promises goodness to cucumberjs steps.

## Usage

In a step definition file, before defining and `Given`, `When`, or `Then` steps, pass the step object to qcumber.

```javascript
module.exports = function(){
	require('qcumber')(this);

	this.Given(/a synchronous (?:pre|post)condition/, function(){
		return true;
	});
}
```
