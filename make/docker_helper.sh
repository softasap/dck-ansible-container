#!/bin/bash

function _getRepository() {
        awk -F= '/repository/{print $2}' version.txt
}

function _getRelease() {
	awk -F= '/release/{print $2}' version.txt
}

function _getPrefix() {
        awk -F= '/prefix/{print $2}' version.txt
}

function getVersion() {
	result=$(_getRelease)
        echo $result
}

function getPrefix() {
        result=$(_getPrefix)
        echo $result
}

function getRepositoryOr() {
        result=$(_getRepository)
        echo ${result-$1}
}

