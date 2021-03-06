self = require: unless typeof require is "undefined" then require else JUMLY.require
utils = self.require "./jasmine-utils"
is_node = self.require("core").env.is_node

describe "SequenceDiagram", ->
  SequenceDiagram = self.require "SequenceDiagram"
  div = utils.div this

  beforeEach ->
    utils.matchers this
    @diagram = new SequenceDiagram "hello"

  it "has .diagram and .sequence-diagram", ->
    expect(@diagram).haveClass "diagram"
    expect(@diagram).haveClass "sequence-diagram"

  it "has no elements just after creation", ->
    expect(@diagram.find("*").length).toBe 0
  
  describe "SequenceParticipant", ->
    SequenceParticipant = self.require "SequenceParticipant"
    beforeEach ->
      @object = new SequenceParticipant "user"
    
    it "has .participant", ->
      expect(@object).haveClass "participant"
      
    it "has name", ->
      expect(@object.find(".name").text()).toBe "user"
   
    unless is_node
      it "has size", ->
        div.append @diagram
        @diagram.append @object
        expect(@object.width()).toBeGreaterThan 0
        expect(@object.height()).toBeGreaterThan 0
  
  describe "SequenceOccurrence", ->

    it "has .occurrence", ->
      SequenceOccurrence = self.require "SequenceOccurrence"
      beforeEach ->
        @occurr = new SequenceOccurrence

  describe "SequenceFragment", ->

    SequenceFragment = self.require "SequenceFragment"
    beforeEach ->
      @fragment = new SequenceFragment "treat all"

    it "has .fragment", ->
      expect(@fragment).haveClass "fragment"

    it "has given name", ->
      expect(@fragment.find(".name").text()).toBe "treat all"

  describe "SequenceRef", ->

    SequenceRef = self.require "SequenceRef"
    beforeEach ->
      @ref = new SequenceRef "another sequence"

    it "has .ref", ->
      expect(@ref).haveClass "ref"

    it "has given name", ->
      expect(@ref.find(".name").text()).toBe "another sequence"
    
