class PhpMtSeed < Formula
  desc "PHP mt_rand() seed cracker"
  homepage "https://www.openwall.com/php_mt_seed/"
  url "https://www.openwall.com/php_mt_seed/php_mt_seed-4.0.tar.gz"
  sha256 "28b94864a1d2988f8eb31909d3f99a166a5973e514d305c115c6cccbe978710d"

  depends_on "libomp"

  def install
    system "make", "CC=#{ENV.cc}", "php_mt_seed"

    doc.install "README"
    bin.install "php_mt_seed"
    bin.install_symlink "php_mt_seed" => "php-mt-seed"
  end

  test do
    run_output = shell_output("#{bin}/php_mt_seed 2>&1 || :")
    assert_match "php_mt_seed VALUE_OR_MATCH_MIN [MATCH_MAX [RANGE_MIN RANGE_MAX]]", run_output
  end
end
