################################################################################
Describe "Get-GenXDevCmdlets" {

    BeforeAll {

    }

    It "Should test basic functionality" {

        $results = Get-GenXDevCmdlets -ModuleName "GenXdev.AI"
        $results | Should -BeOfType [System.Collections.IEnumerable]

        $count = 0;
        $results | ForEach-Object {

            if ($_.Name -eq "AssureLMStudio") {

                $count++
            }
        }

        $count | Should -Be 1
    }
}
################################################################################
