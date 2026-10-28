class Avair < Formula
  desc "Command-line access to Avair campaigns, playbooks, tasks, and tools"
  homepage "https://www.avair.ai/resources/cli"
  url "https://registry.npmjs.org/@avair/cli/-/cli-0.2.2.tgz"
  sha256 "5fe2c95071ba367a4f327f4547901acb2a78d45a7f978efa4f7917116f5baad7"
  license "MIT"

  depends_on "node@22"

  def install
    system Formula["node@22"].opt_bin/"npm", "install", *std_npm_args
    (bin/"avair").write_env_script libexec/"bin/avair", PATH: "#{Formula["node@22"].opt_bin}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/avair --version")
  end
end
