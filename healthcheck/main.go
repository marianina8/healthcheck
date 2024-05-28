/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
package main

import (
	"fmt"
	"net/http"

	"github.com/inconshreveable/go-update"
	"github.com/marianina8/healthcheck/healthcheck/cmd"
)

func main() {

	cmd.Execute()
}

func doUpdate(url string) error {
	resp, err := http.Get(url)
	if err != nil {
		return err
	}
	defer resp.Body.Close()
	err = update.Apply(resp.Body, update.Options{})
	if err != nil {
		if rerr := update.RollbackError(err); rerr != nil {
			fmt.Println("Failed to rollback from bad update: %v", rerr)
		}
	}
	return err
}
