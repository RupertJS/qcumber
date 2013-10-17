# qcumber

Add [Q][Q] promises goodness to cucumberjs steps.

## Usage

In a step definition file, before defining and `Given`, `When`, or `Then`
steps, pass the step object to qcumber.

```javascript
module.exports = function(){
	require('qcumber')(this);

	this.Given(/a synchronous condition/, function(){
		return true;
	});
}
```

Now, any step definitions will promise to behave. Any step that throws an
exception will be marked as a failure. Any step that returns normally will
count as a success. Any step that returns a promise-like will behave
asynchronously, counting as a success if the promise resolves, or a failure if
the promise rejects.

```javascript
module.exports = function(){
	require('qcumber')(this);

	this.Given(/a synchronous condition/, function(){
		return true;
	});

	this.When(/an asynchronous action/, function(){
		return HTTP.Request.get_with_promise('http://localhost');
	});

	this.Then(/a failure condition/, function(){
		throw new Error('A failure occured in this step.');
	});
}
```

[Q]: https://github.com/kriskowal/q