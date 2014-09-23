# Collaborative Create-Your-Own-Adventure

This is a create-your-own-adventure story where at each step, the reader chooses
what action to take and turns to an appropriate page of the story based on their
choice.  It is collaborative because it is written one small piece at a time by
many authors.  To start reading the story, click [here](language.md).

## Format of the Story

Each "page" of this story is a separate file.  The files are Markdown, which
means they are plain text, but with a few special capabilities.  The only
Markdown capability used in this story is links.  By putting text in brackets
and a URL in parentheses, you can add a link to the story.  For example, the
following text would turn "here" into a link to Google: "Click
\[here\](www.google.com) to visit Google."

## Contribution Guidelines

### Make Appropriately Sized Changes

Try to keep your change small.  Part of the fun of a collaborative story is
that no one person writes very much of it!  On the other hand, please **don't**
add an option and then not add any story for readers who choose that option, or
the story will soon be full of dead links.  Here are some examples of
appropriate changes:

* Add a sentence or two to an existing "page" (file) of the story.
* Add a new option to an existing choice point, and link that option to an
  existing "page".
* Add a new option to an existing choice point, create a new "page" for that
  option, and add a sentence or two to the new "page".
* Add a couple of options to a current dead-end "page", and add a "page" or link
  to an existing "page" for each option.

### Use Relative Links

The links in this file should be relative links so that they will still work if
the repository is forked.  View the [language.md](language.md) file for an
example of relative links.  (Click the "Raw" button to view the text that
creates the links.)  You can also use `..` to refer to the parent of the
current directory if necessary.

### Directory Structure

Try to keep the files that make up the story somewhat organized.  A good rule of
thumb is to create a new directory for each option, then put the file with the
resulting story inside that directory.  If you want to add multiple ways of
getting to the same point, use your best judgment about how to organize this.

### Line Length

Please keep all lines to 120 characters or fewer.  Otherwise, the raw files
will be difficult to read in the browser or on the command line, and changes
will be harder to review.

### Blank Lines Between Options

Insert blank lines between different options so that the options will be
visually separated.

### Avoid Using Markdown Features

Other than links, please only use plain text in your story and not the other
features of Markdown.  We want it to be easy to read the raw files even for
people who don't know Markdown.
