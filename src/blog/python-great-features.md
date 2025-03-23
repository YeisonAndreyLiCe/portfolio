---
title: Python Great Features
pubDate: 2024-11-04
description: "Python Great Features"
tags: ["python"]
snippet:
  language: "python"
  code: "def stateful_function():\n
    cache = {}\n
    def wrapper_function(*args, **kwargs):\n    key = str(args) +
    st(kwargs)\n    if key not in cache:\n       cache[key] =
    func(*args, **kwargs)\n     return cache[key]\n\n
    return wrapper_function\n

@stateful_function\n
def fibonacci(n):\n    if n < 2:\n      return n\n    return fibonacci(n-1) +
fibonacci(n-2)
"
---

## Duck Typing, ABCs, and Protocols

> If it looks like a duck, swims like a duck, and quacks like a duck,
> then it probably is a duck.

The idea behind duck typing is that you don't need to check the type of an
object before using it. Instead you care about what methods and properties
the object has (API). If it has the methods and properties you need,
you can use it.

Abstract Base Classes (ABCs) and Protocols enable us keeping the flexibility of
duck typing, but also having some kind of type checking

### Abstract Base Classes (ABCs)

ABCs provide a way to enforce a contract between classes.

```python
from abc import ABC, abstractmethod

class Animal(ABC):
    def __init__(self, name):
        self.name = name

    @abstractmethod
    def speak(self):
        raise NotImplementedError("speak() must be implemented")

class Dog(Animal):
    def speak(self):
        return 'Woof!'
```

### Protocols

> The term protocols is used for some types supporting structural subtyping.
>
> A structural type defines a set of values not by their **class**,
> but by their properties (e.g. attributes, methods, dictionary key/value types)

Protocols are a way to define a set of methods that a class must implement in
order to be considered an instance of that protocol.

```python
from typing import Protocol

class Animal(Protocol):
    def speak(self) -> str: ...

class Dog:
    def speak(self) -> str:
        return 'Woof!'

def speak(pet: Animal) -> int:
    return pet.speak()

speak(Dog())  # Passes static type check
```

## Type Hints

Type hints are a way to add type information to your code. They are not enforced
by Python, but they can be used by tools like **MyPy** to check your code
for type errors.

```python
def add(x: int, y: int) -> int:
    return x + y
```

I will use type hints in the I will provide in this post.

## Functional Features

### Closures

Functions are stateless by default. Closures are a way to keep the state of a
function between calls.

A closure is a function object that remembers values in enclosing scopes. Note
that a closure returns a function that remembers the values of the variables
in the enclosing scope even after the execution has moved out of that scope.
It means variables in the enclosing scope are keep in memory even after the
function has finished executing.

```python
from collections import Callable

def get_token() -> Callable[[], str]:
    _token: str | None = None
    def _get():
        nonlocal _token
        if _token:
            print('Using cached token')
            return _token

        print('Fetching new token')
        # call some API to get the token
        _token = request_token()
        return _token
    return _get

token = get_token()
print(token())
print(token())
print(token())
```

```bash
Fetching new token
token
Using cached token
token
Using cached token
token
```

The following example shows how to use a closure to keep the state of a function
between calls, so we don't have to request a new token every time we need it.

```python
from aiohttp import (
    ClientSession,
)
import asyncio
from collections.abc import (
    Callable,
    Awaitable,
)
import os


def _get_access_token() -> Callable[[ClientSession], Awaitable[str]]:
    current_token: str | None = None

    async def _access_token(session: ClientSession) -> dict[str, str]:
        nonlocal current_token

        if current_token:
            print('Using cached token')
            current_token

        print('Fetching new token')
        PUBLIC_KEY = os.getenv("PUBLIC_KEY")
        SECRET_KEY = os.getenv("SECRET_KEY")
        text = f"{PUBLIC_KEY}:{SECRET_KEY}"
        encode = base64.b64encode(text.encode("utf-8"))
        token = str(encode, "utf-8")
        authorization = f"Basic {token}"
        headers = {**COMMON_HEADERS, "Authorization": authorization}
        async with session.post(
            "/login",
            headers=headers,
        ) as response:
            content = await response.json()
            if content and content.get("token"):
                current_token = content["token"]

        if current_token is None:
            raise ValueError("Token not found")

        return current_token

    return _access_token


_get_access_token = _get_headers()

async def main() -> None:
    async with ClientSession("https://api.example.com/") as session:
        token = await _get_access_token(session)
        token = await _get_access_token(session)
        token = await _get_access_token(session)
        token = await _get_access_token(session)

asyncio.run(main())
```

```bash
Fetching new token
Using cached token
Using cached token
Using cached token
```

### Decorators (Higher order functions)

Decorators are a way to wrap a function and add extra functionalities to
such a function.

In the following example we define a decorator that adds an access token to
the headers of a request. Note that the decorator receives a function that
receives a `ClientSession` instance as first argument, that instance will be
used to get the access token without having to open a new session for each
request.

```python
from aiohttp import (
    ClientSession,
)
from typing import (
    Callable,
    ParamSpec,
    TypeVar,
)
from typing_extensions import (
    Concatenate,
)


T = TypeVar('T')
P = ParamSpec('P')


def add_headers(
    func: Callable[Concatenate[ClientSession, P], Awaitable[T]],
) -> Callable[Concatenate[ClientSession, P], Awaitable[T]]:
    @wraps(func)
    async def decorated(
        session: ClientSession, /, *args: P.args, **kwargs: P.kwargs
    ) -> R:
        token = await _get_access_token(session)
        headers = {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": f"Bearer {token}",
        }
        kwargs["headers"] = headers

        return await func(session, *args, **kwargs)

    return decorated


@add_headers
async def get_user(
    session: ClientSession,
    user_id: int,
    *,
    headers: dict[str, str] | None = None
) -> str:
    async with session.get(f"users/{id}", headers=headers) as resp:
        return await resp.json()

async with ClientSession("https://api.example.com/") as session:
    user = await get_user(session, 1) # headers will be added by the decorator
```

#### wraps

without `@wraps` the name of the function will be `wrapper_function`

```python
def mock_decorator(original_function):
    def wrapper_function(*args, **kwargs):
        return original_function(*args, **kwargs)
    return wrapper_function

@mock_decorator
def f(x):
    '''Docstring'''
    return x ** 2

print(f.__name__)
print(f.__doc__)
```

```bash
wrapper_function
None
```

```python
from functools import wraps

def mock_decorator(original_function):
    @wraps(original_function)
    def wrapper_function(*args, **kwargs):
        return original_function(*args, **kwargs)
    return wrapper_function

@mock_decorator
def f(x):
    '''Docstring'''
    return x ** 2

print(f.__name__)
print(f.__doc__)
```

```bash
f
Docstring
```

```python
def stateful_function():
    cache = {}
    def wrapper_function(*args, **kwargs):
        key = str(args) + str(kwargs)
        if key not in cache:
            cache[key] = func(*args, **kwargs)
        return cache[key]
    return wrapper_function

@stateful_function
def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n-1) + fibonacci(n-2)
```

#### cache

```python
import time
from functools import cache

def timer(function):
    def wrapper(*args, **kwargs):
        start = time.time()
        result = function(*args, **kwargs)
        end = time.time()
        print(f'Elapsed time: {end - start}')
        return result
    return wrapper

@cache
def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

@timer
def fibonacci_timer(n):
    return fibonacci(n)
```

This is kinda like a cache (`memoization`), so that the function doesn't have
to be called again if the arguments are the same.

## Working with Files

### Generators

Generators are a special class of functions that simplify the task of writing
iterators. Generators are a simple and powerful tool for creating iterators.
They are written like regular functions but use the `yield` statement whenever
they want to return data. Each time `next()` is called on it, the generator
resumes where it left off
(it remembers all the data values and which statement was last executed).

Generators are iterators, a kind of iterable you can only iterate over once.
It’s because they do not store all the values in memory, they generate the
values on the fly, that allows processing of large amounts of data efficiently.

```python
def read_large_file(filename):
    with open(filename) as file:
        while True:
            chunk = file.read(1000)
            if not chunk:
                break
            yield chunk

for chunk in read_large_file('file.txt'):
    print(chunk)
```

```python
def fibonacci(n):
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

for i in fibonacci(10):
    print(i)
```

```bash
0
1
1
2
3
5
8
13
21
34
```

### Context Managers

Context managers are used to allocate and release resources precisely when you
want to. They are very useful when you are working with external resources like
files, network connections, etc. Context managers are normally implemented
using a class that implements the special methods `__enter__()`
and `__exit__()`. The `__enter__()` method is invoked when the `with` statement
is encountered. The `__exit__()` method is invoked at the end of the `with`
block.

```python
class OpenFile:
    def __init__(self, filename, mode):
        self.filename = filename
        self.mode = mode

    def __enter__(self):
        self.file = open(self.filename, self.mode)
        return self.file

    def __exit__(self, exc_type, exc_val, traceback):
        self.file.close()

with OpenFile('sample.txt', 'w') as f:
    f.write('Testing')

with open('sample.txt', 'r') as f:
    print(f.read())
```

```python
import time

class Timer:
    def __init__(self):
        self.start = None
        self.end = None

    def __enter__(self):
        self.start = time.time()
        return self

    def __exit__(self, exc_type, exc_val, traceback):
        self.end = time.time()

    def elapsed_time(self):
        return self.end - self.start

with Timer() as timer:
    print('This should take approximately 2 seconds')
    time.sleep(2)

print('Elapsed time: {}'.format(timer.elapsed_time()))
```

Note that the `__exit__()` method can optionally return a Boolean value. If it
returns `True`, any exception raised within the `with` block is suppressed and
execution proceeds as if no exception had occurred. If it returns `False`, any
exception raised within the `with` block is not suppressed and execution
proceeds normally.

```python
lock = threading.Lock()

class LockedContext:
    def __init__(self, lock):
        self.lock = lock

    def __enter__(self):
        print('acquiring lock')
        self.lock.acquire()

    def __exit__(self, exc_type, exc_val, traceback):
        print('releasing lock')
        self.lock.release()

with LockedContext(lock):
    print('Lock acquired')

# The lock is automatically released when the with block ends,
# even if an error occurs
```
