const res = await fetch("http://127.0.0.1:8000/register", {
  method: "POST",
  headers: {
    "Content-Type": "application/json"
  },
  body: JSON.stringify({
    name: "1",
    email: "test3",
    password: "0721"
  })
});

const data = await res.json();
console.log(data);
