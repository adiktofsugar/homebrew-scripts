# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class GroovyLint < Formula
  desc "cli groovy linter"
  homepage "https://github.com/adiktofsugar/groovy-lint"
  url "https://github.com/adiktofsugar/groovy-lint.git", using: :git, tag: "1.0.0"
  head "https://github.com/adiktofsugar/groovy-lint.git", using: :git, branch: "master"

  depends_on :java
  depends_on "groovy"

  def install
    system "./build", "-p", prefix
    lib.install Dir["lib/*"]
    libexec.install Dir["libexec/*"]
    bin.install "bin/groovy-lint"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test groovy`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/groovy-lint", "-h"
  end
end
