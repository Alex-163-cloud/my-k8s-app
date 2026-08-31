package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello from K8s! 👋\n")
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Server is running on :8080")
	http.ListenAndServe(":8080", nil)
}
