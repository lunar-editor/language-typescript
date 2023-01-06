fs = require 'fs'
path = require 'path'
TextEditor = null
buildTextEditor = (params) ->
  if atom.workspace.buildTextEditor?
    atom.workspace.buildTextEditor(params)
  else
    TextEditor ?= require('atom').TextEditor
    new TextEditor(params)

describe "JavaScript grammar", ->
  grammar = null

  beforeEach ->
    atom.config.set('core.useTreeSitterParsers', false)

    waitsForPromise ->
      atom.packages.activatePackage("language-typescript")

    runs ->
      grammar = atom.grammars.grammarForScopeName("source.ts")

  it "parses the grammar", ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe "source.ts"
