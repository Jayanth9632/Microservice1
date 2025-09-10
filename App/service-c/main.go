package main


import (
"fmt"
"net/http"
"os"
)


func main() {
http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
w.Header().Set("Content-Type", "application/json")
w.Write([]byte(`{"service":"c","message":"ok"}`))
})
http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
fmt.Fprint(w, "ok")
})


port := os.Getenv("PORT")
if port == "" { port = "8080" }
fmt.Println("Service C listening on", port)
http.ListenAndServe(":"+port, nil)
}