require "shellwords"

module Git

  def self.is_repo?
    system "git rev-parse --git-dir > /dev/null 2>&1"
  end

  def self.has_uncommitted_changes?
    !system "git diff-index --quiet HEAD --"
  end

  def self.current_branch
    `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \\(.*\\)/\\1/'`.chomp
  end

  def self.default_branch
    __default_branch ||
        (__reset_default_branch! && __default_branch) ||
        (raise "Couldn't figure out default branch")
  end

  def self.__default_branch
    `git symbolic-ref -q --short refs/remotes/origin/HEAD`[/^origin\/(.+)$/, 1]
  end

  def self.__reset_default_branch!
    echo_run! "git remote set-head origin --auto"
  end

  def self.show_ref(ref_name)
    # refs/heads/ or else results include refs/remotes/...
    # and we get more than one SHA back
    ref = "refs/heads/#{Shellwords.escape(ref_name)}"

    shas = `git show-ref #{ref} -s`.split

    if shas.empty?
      raise "No SHAs for ref #{ref.inspect}"
    end

    if shas.length > 1
      raise "Multiple SHAs for ref #{ref.inspect}"
    end

    shas.first
  end

end
